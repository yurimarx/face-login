import axios from 'https://unpkg.com/axios/dist/axios.min.js'

export default function compareFaces(formData) {
    axios.post("http://localhost:32773/csp/facelogin/faceCompare", formData, {
        	headers: {
          	"Content-Type": "multipart/form-data",
        	}
      	}).then((res) => {
        	alert(res);
      	}).catch((err) => {
        	alert(err);
      	});
}
