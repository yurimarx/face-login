Class dc.facelogin.Face Extends %Persistent
{

Property username As %String;

Property face As %Stream.GlobalBinary;

Storage Default
{
<Data name="FaceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>username</Value>
</Value>
<Value name="3">
<Value>face</Value>
</Value>
</Data>
<DataLocation>^dc.facelogin.FaceD</DataLocation>
<DefaultData>FaceDefaultData</DefaultData>
<IdLocation>^dc.facelogin.FaceD</IdLocation>
<IndexLocation>^dc.facelogin.FaceI</IndexLocation>
<StreamLocation>^dc.facelogin.FaceS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
