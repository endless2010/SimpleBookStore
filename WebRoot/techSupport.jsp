<%@ page pageEncoding="GB2312"%>
<%@ page import="bookshop.util.DataBase" %>

<html >
	<head>
		<!--<title>正在获取网站数据……</title>-->
		<script language=javascript>

		function HideConnMsg()
		{
			var i =0;
			var objName = 'divConnMsg';

			for( i = 0; i < document.frmConn.all.length; i++)
			{
				var obj = document.frmConn.all[i];

				if (obj.name == objName)
				{
					obj.style.display = "none";
					return;
				}
			}

		}

		</script>
	</head>
	<body >
		<form id="frmConn" name="frmConn" >
		<%
			String strMsg;
			strMsg = "    <div id=\"divConnMsg\" name=\"divConnMsg\" align=center>" + "\n";
                        strMsg = strMsg + "        <table><tr><td height=150></td></tr></table>" + "\n";
			strMsg = strMsg +  " <br><br>" + "\n";
			strMsg = strMsg +  "     " + "\n";
			strMsg = strMsg +  "    </div>" + "\n";
			out.println(strMsg);
                        out.flush();
                        response.flushBuffer();
			boolean bOpen;
                        DataBase db = new DataBase();
                        //rt = db.connect();
                        bOpen = ("" == db.m_strErrMsg );

			strMsg = "";
			strMsg = strMsg + "\n";
			strMsg = strMsg + "<script language=\"javascript\">" + "\n";
			strMsg = strMsg +  "  HideConnMsg();" + "\n";
			strMsg = strMsg +  "</script>" + "\n";
                        out.println(strMsg);
                        out.flush();

                        if( !bOpen )
                        {
                          	strMsg = "";
				strMsg = strMsg + "\n";
				strMsg = strMsg +  "<div id=\"divErrMsg\" align=center>" + "\n";
	                        strMsg = strMsg + "        <table><tr><td height=150></td></tr></table>" + "\n";
				strMsg = strMsg +  "  <table>";
				strMsg = strMsg +  "    <tr><td algin=left><b>有错误发生：     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><br><br></td></tr>" + "\n";
				//strMsg = strMsg +  "    <tr><td algin=left>Err Number:" + ex.hashCode()  + "<br><br></td></tr>" +  "\n";
				strMsg = strMsg +  "    <tr><td algin=left>错误提示：" + db.m_strErrMsg + "<br><br></td></tr>" +  "\n";
				//strMsg = strMsg +  "    <tr><td algin=left>查看IIS提示：<a href="ShowIISError();">View</a><br><br></td></tr>" +  "\n";
				//strMsg = strMsg +  "    <tr><td algin=left><font color=red> "+"Error" +"<br><br></font></td></tr>" + "\n";
				strMsg = strMsg +  "    <tr><td algin=left> Support: <a href=\"http://www.trfsoft.com/\" target=_blank>The Terrificsoft</a> <br></td></tr>" + "\n";
			    //strMsg = strMsg +  "    <tr><td algin=left> 网址: <a href=\"http://www.trfsoft.com/\" target=_blank>http://www.trfsoft.com</a> <br></td></tr>" + "\n";
				strMsg = strMsg +  "  </table>";
				strMsg = strMsg +  "</div>" + "\n";
 		        	strMsg = strMsg + "</form></body></html>";

				out.println(strMsg);
                                out.flush();
                                out.close();
                        }
                        else
                        {
                          db.finalize();
                        }
		%>
		</form>
	</body>
</html>
