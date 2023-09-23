Class cls.dc.facelogin.Teste Extends %RegisteredObject
{

/// Description
ClassMethod Teste() As %Status
{
    Set sc = $$$OK 
    Set sql = "SELECT * FROM dc_facelogin.Face WHERE username = ?"
    Set tStatement = ##class(%SQL.Statement).%New()
    Set success = tStatement.%Prepare(sql)
    If success'= 1 { Write "%Prepare failed:" Do $System.Status.DisplayError(success) Quit }
    Set rset = tStatement.%Execute("_SYSTEM")
    Do rset.%Next()
    Set face = ##class(dc.facelogin.Face).%OpenId(rset.ID)
    Set destination = ##class(%Stream.FileBinary).%New()
    Set path = ##class(%File).TempFilename("png")
    Set destination.Filename = path
    Do destination.CopyFrom(face.face) 
    Do destination.%Save()
    
    Return sc
}

}
