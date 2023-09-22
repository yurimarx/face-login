Class dc.facelogin.FaceLogin Extends %CSP.Login
{

ClassMethod OnLoginPage() As %Status
{
	// text strings
	Set ConfigName = $P($zu(86),"*",2) 
	// get key, lookup in localization global
	Set tLang = $$$SessionLanguage
	Set tTitle = $$FormatText^%occMessages($$$GetSysMessage(tLang,..#DOMAIN,"logintitle","Login %1"),ConfigName)
	Set tPrompt = $$$GetSysMessage(tLang,..#DOMAIN,"loginenter","Please login")
	Set tUserName = $$$GetSysMessage(tLang,..#DOMAIN,"loginusername","User Name")
	Set tPassword = $$$GetSysMessage(tLang,..#DOMAIN,"loginpassword","Password")
	Set tLogin = $$$GetSysMessage(tLang,..#DOMAIN,"login","LOGIN")
	Set envClientId = ##class(%SYSTEM.Util).GetEnviron("CLIENT_ID")
	Set envLoginURI = ##class(%SYSTEM.Util).GetEnviron("LOGIN_URI")
	Set OtherAutheEnabled = $$OtherAuthEnabled^%SYS.cspServer(%request)
	&html<<html>>
	Do ..DrawHEAD(tTitle)

	&html<
		<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="pageLoad();">
			<div id="content">
		>
 
	Do ..DrawTitle(tTitle)

 	&html<
 		
	<div style="background-color:#FBFBFB;">
 	<table border="0" cellpadding="10" align="center" class="LayoutTable">
 	<tr>
	<td align="center">
 	<table border="0" width="100%" cellpadding="5" cellspacing="0">>
 	&html<<tr><td style="height:4px;"><br/></td></tr>>
 	
 	&html<<tr><td><center>>

  If OtherAutheEnabled = 1 {
	// Show standard login form

	
	Write ..InsertHiddenFields($ZConvert($G(%request.Data("Error:URL",1)),"O","HTML"))

	&html<
	<table class="login" border="0" cellspacing="6" cellpadding="6" >
	<tr valign="bottom">
	<td nowrap class="loginCaption">#(tUserName)#</td>
	<td>
		<input type="text" size="30" name="IRISUsername" autocomplete="off" value="#($ZCVT($get(%request.Data("IRISUsername",1)),"O","HTML"))#"/>
	</td>
 	</tr>
	<tr valign="bottom">
	<td nowrap class="loginCaption">#(tPassword)#</td>
	<td><input type="password" size="30" name="IRISPassword" autocomplete="off"/>
	</td>
	</tr>
	<tr><td>&nbsp;</td>
	 <td><button class="button" id="capture" style="width:120px;">#(tLogin)#</button></td>
	</tr>
	</table>
	<table style="margin-left: auto; margin-right: auto; text-align: center; vertical-align: middle;">
	<!--tr><td>&nbsp;</td>
	 <td style="text-align:right"><input type="submit" name="IRISLogin" class="button" value="#(tLogin)#" style="width:120px;"></td>
	</tr-->
	<tr>
		<td style='text-align:center; vertical-align:middle'>
			<video id="video" autoplay width="300px" height="300px"></video>
		</td>
		
	</tr>
	</table>
	<canvas hidden id="canvas"></canvas>

	</center></div>>

	// js functions
	&html<<script language="javascript"> 

	
	navigator.mediaDevices.getUserMedia({video: true}).then(function (mediaStream) {
		const video = document.querySelector('#video');
		video.srcObject = mediaStream;
		video.play();
	});

	document.querySelector('#capture').addEventListener('click', function (e) {
    	var canvas = document.querySelector('#canvas');  
    	canvas.height = video.videoHeight;
    	canvas.width = video.videoWidth;
		var context = canvas.getContext('2d');
    	context.drawImage(video, 0, 0);
		let imageBlob = canvas.toDataURL();

		const file = dataUrlToFile(imageBlob);

		let formData = new FormData();
		formData.append("source", file, "source.png"); 
		formData.append("target", file, "target.png");

		compareFaces(formData);
    });	
		//setCookie('faceImg', canvas.toDataURL());
	
	</script>>

  }  // End OtherAutheEnabled = 1 block
  Else {
	
	// This is accessed when IRIS is installed with minimum security and user clicked Logout.
	Set msg1 = $$$GetSysMessage(tLang,..#DOMAIN,"loginclickhere","Please click here to log in.")
	Do 
	Set tLink = ..Link("/csp/sys/UtilHome.csp")
	
	&html<
	<a href="#(tLink)#" class="loginlink">#(msg1)#</a><br>
	<a href="javascript:newSession();" class="loginlink">New Login</a> 
	</center>
	</td>
	</tr>
	</table>
	>
  }

 	// test for error
 	Set tMsg = $Get(%request.Data("Error:ErrorCode",1))
 	If ((tMsg'="")&&($SYSTEM.Status.GetErrorCodes(tMsg)'[$$$ERRORCODE($$$RequireAuthentication))) {
 		&html<<tr><td><center>>
 		Do ShowError^%apiCSP(tMsg)
 		&html<</center></td></tr>>
 	}

 	&html<</td></tr><tr><td style="height:180px;"><br/></td></tr></table></div></div></body></html>>

 	Quit $$$OK
}

ClassMethod DrawHEAD(pTitle = "")
{
	&html<<head>
	<title>#(pTitle)#</title>>

	&html<<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js" type="module"></script>>

	// link in stylesheet specified by parameter
	If (..#STYLESHEET '= "") { 
		&html<<link rel="stylesheet" type="text/css" href="#(..Link(..#STYLESHEET))#">>
	}
	If (..#FAVORITEICON '= "") {
		&html<<link rel="icon" type="image/ico" href="#(..Link(..#FAVORITEICON))#">>
	}
	// js functions
	&html<<script language="javascript">

	function dataUrlToFile(dataurl, filename) {
		const arr = dataurl.split(',')
		const mime = arr[0].match(/:(.*?);/)[1]
		const bstr = atob(arr[1])
		let n = bstr.length
		const u8arr = new Uint8Array(n)
		while (n) {
			u8arr[n - 1] = bstr.charCodeAt(n - 1)
			n -= 1 // to make eslint happy
		}
		return new File([u8arr], filename, { type: mime })
	}

	const compareFaces = (formData) => {
		axios.post("http://localhost:32773/csp/facelogin/faceCompare", formData, {
			headers: {
			"Content-Type": "multipart/form-data",
			}
		}).then((res) => {
			if(res.data.result == 1) {
				alert('mesmo usuario')
			} else {
				alert('outro usuário')
			}
		}).catch((err) => {
			alert(err);
		});	
	};

	// called when page is loaded
	function pageLoad()
	{
		// see if we can give focus to the UserName field:
		if (self.document.Login && self.document.Login.IRISUsername) {
			self.document.Login.IRISUsername.focus();
			self.document.Login.IRISUsername.select();
		}

		return true;
	}
	
	</script>>
	If ##class(%ZEN.Utils).%BrowserSupportsHTML5(%request.UserAgent) {
		Do ..DrawCSS3STYLE()
	}
	Else {
		Do ..DrawSTYLE()
	}
	&html<</head>>
}

ClassMethod OnPreHTTP() As %Boolean [ ServerOnly = 1 ]
{
	If '$$UseCSRFtoken^%SYS.cspServer(%request.AppData) RETURN 1
	Set token=##class(%OAuth2.Utils).Base64UrlEncode($system.Encryption.GenCryptRand(12))
	Set %response.Context("IRISSessionToken")=token
	Set cookiepath=%session.CookiePath
	If $extract(cookiepath,*)'="/" Set cookiepath=cookiepath_"/"
	Set sameSite=$$$GetCookieScopeString(%session.SessionScope)
	Do %response.SetCookie("IRISSessionToken",token,,$zcvt($zcvt(cookiepath,"O","UTF8"),"O","URL"),,%request.Secure,1,sameSite)
	RETURN 1
}

}
