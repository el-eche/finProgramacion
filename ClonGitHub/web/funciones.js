/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function cargaDocXML(rutaxml)
{
if (window.XMLHttpRequest) {
   xhttp=new XMLHttpRequest();
   }
else {
   xhttp=new ActiveXObject("Microsoft.XMLHTTP");
   }
xhttp.open("GET",rutaxml,false);
xhttp.send();
return xhttp.responseXML;
}

