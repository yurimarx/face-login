Class dc.facelogin.FaceLoginAPI Extends %CSP.REST
{

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

Parameter CONTENTTYPE = "multipart/form-data";

Parameter Version = "1.0.0";

Parameter HandleCorsRequest = 1;

ClassMethod PostFace() As %Status
{
    
    set success = $$$OK

    Try {
        Set info = {}
        
        Set username = $GET(%request.Data("username",1))
        Set password = $GET(%request.Data("password",1))

        set success = $SYSTEM.Security.Login(username,password)

        If (success = 1) {
            Set source = %request.GetMimeData("file")
            Set face = ##class(Face).%New() 
            Set face.username = username
            Set success = face.face.CopyFrom(source)
            Set success = face.%Save()
            
            If (success = 1) {    
                Set info.message = "Face registered successfully"
            } Else {
                Set info.message = "Error while saving the face. Try again."
            }
       
        } Else {
            Set info.message = "Error with credentials. Check it and try Again"
        }
        
        Set %response.ContentType = ..#CONTENTTYPEJSON
        Set %response.Headers("Access-Control-Allow-Origin")="*"
 
        Write info.%ToJSON()
 
        Set success=$$$OK
   
    } Catch e {
        Set success=e.AsStatus()
    }
 
    Quit success
}

ClassMethod FaceCompare() As %Status
{
    
    set success = $$$OK

    Try {
        Set info = {}
        
        Set source = %request.GetMimeData("source")
        Set target = %request.GetMimeData("target")
            
        Set sourceFile = ..SaveStreamAsTempFile(source, "png")
        Set targetFile = ..SaveStreamAsTempFile(target, "png")        
        
        Set faceComparationResult = ..CompareFaces(sourceFile, targetFile)

        Set info.result = faceComparationResult
    
        Set %response.ContentType = ..#CONTENTTYPEJSON
        Set %response.Headers("Access-Control-Allow-Origin")="*"
 
        Write info.%ToJSON()
 
        Set success=$$$OK
   
    } Catch e {
        Set success=e.AsStatus()
    }
 
    Quit success
}

ClassMethod LoginByFace() As %Status
{
    
    Set info = {}
    Set source = %request.GetMimeData("file")
    
    Set sql = "SELECT * FROM dcfacelogin.Face WHERE username = ?"
    Set tStatement = ##class(%SQL.Statement).%New()
    Set success = tStatement.%Prepare(sql)
    If success'= 1 { Write "%Prepare failed:" Do $System.Status.DisplayError(success) Quit }
    Set rset = tStatement.%Execute($GET(%request.Data("username",1)))
    Do rset.%Next()
    
    Set sourceFile = SaveStreamAsTempFile(source, "png")
    Set targetFile = SaveStreamAsTempFile(rset.face, "png")
    
    Set faceComparationResult = CompareFaces(sourceFile, targetFile)

    Set info.result = faceComparationResult
    
    set success = $$$OK
    Quit success
}

ClassMethod CompareFaces(sourceFile As %String, targetFile As %String) As %Integer [ Language = python ]
{
    import face_recognition
    result = 0

    sourceImage = face_recognition.load_image_file(sourceFile)
    sourceEncodingArray = face_recognition.face_encodings(sourceImage)
    if len(sourceEncodingArray) > 0:
        sourceEncoding = face_recognition.face_encodings(sourceImage)[0]

    targetImage = face_recognition.load_image_file(targetFile)
    targetEncodingArray = face_recognition.face_encodings(targetImage)
    if len(targetEncodingArray) > 0:
        targetEncoding = face_recognition.face_encodings(targetImage)[0]

    if ((len(sourceEncodingArray) > 0) & (len(targetEncodingArray) > 0)):
        results = face_recognition.compare_faces([sourceEncoding], targetEncoding)
        if(results[0] == True):
            result = 1

    return result
}

ClassMethod SaveStreamAsTempFile(stream As %Stream.Object, extension As %String) As %String
{
    Set destination = ##class(%Stream.FileBinary).%New()
    Set path = ##class(%File).TempFilename(extension)
    Set destination.Filename = path
    Do destination.CopyFrom(stream) 
    Do destination.%Save()
    Return path
}

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
 
<!-- post face -->
<Route Url="/postFace" Method="POST" Call="PostFace" />

<!-- login by face -->
<Route Url="/faceLogin" Method="POST" Call="LoginByFace" />

<!-- face compare -->
<Route Url="/faceCompare" Method="POST" Call="FaceCompare" />

</Routes>
}

}
