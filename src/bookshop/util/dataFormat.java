package bookshop.util;

import java.util.StringTokenizer;

public class dataFormat {
	public dataFormat() {
	}

	/**
	 * ���ַ���ת�����ʺ�����ҳ��ʾ���ı�
	 * 
	 * @param s
	 * @return
	 */
	public static String toHtml(String s) {
		if (s == null)
			return s;
		s = strReplace(s, "&", "&amp;");
		s = strReplace(s, "<", "&lt;");
		s = strReplace(s, ">", "&gt;");
		s = strReplace(s, "\"", "&quot;");
		s = parseReturn(s, "<br>\n&nbsp;&nbsp;&nbsp;&nbsp;");
		return s;
	}

	/**
	 * ���ַ���sBody�е�sFrom��sTo�滻
	 * 
	 * @param sBody
	 * @param sFrom
	 * @param sTo
	 * @return
	 */
	public static String strReplace(String sBody, String sFrom, String sTo) {
		int i, j, k, l;
		if (sBody == null || sBody.equals(""))
			return "";
		i = 0;
		j = sFrom.length();
		k = sTo.length();
		StringBuffer sss = new StringBuffer(sBody.length());
		boolean bFirst = true;
		l = i;
		while (sBody.indexOf(sFrom, i) != -1) {
			i = sBody.indexOf(sFrom, i);
			sss.append(sBody.substring(l, i));
			sss.append(sTo);
			i += j;
			l = i;
		}
		sss.append(sBody.substring(l));
		return sss.toString();
	}

	/**
	 * ���ַ����е�"\r\n"ת����"\n"
	 * 
	 * @param String
	 *            sBody : Ҫ�����滻�������ַ���
	 * @param String
	 *            sEndwith : Ҫ�滻��Ϊ���ַ���
	 */
	public static String parseReturn(String sBody, String sEndwith) {
		StringTokenizer t = new StringTokenizer(sBody, "\r\n");
		StringBuffer sss = new StringBuffer(sBody.length());
		boolean bFirst = true;
		if (sEndwith.trim().equals(""))
			sEndwith = "\n";
		while (t.hasMoreTokens()) {
			String s = t.nextToken();
			s = s.trim();
			while (s.startsWith("��"))
				s = s.substring(2);
			if (!s.equals("")) {
				if (bFirst) {
					bFirst = false;
				} else {
					sss.append(sEndwith);
				}
				sss.append(s);
			}
		}
		return sss.toString();
	}

	/**
	 * ���ַ�����ʽ���� HTML ������� ֻת�������ַ����ʺ��� HTML �еı�������
	 * 
	 * @param str
	 *            Ҫ��ʽ�����ַ���
	 * @return ��ʽ������ַ���
	 */
	public static String toHtmlInput(String str) {
		if (str == null)
			return null;
		String html = new String(str);
		html = strReplace(html, "&", "&amp;");
		html = strReplace(html, "<", "&lt;");
		html = strReplace(html, ">", "&gt;");
		return html;
	}

	/**
	 * ����ͨ�ַ�����ʽ�������ݿ��Ͽɵ��ַ�����ʽ
	 *
	 * @param str
	 *            Ҫ��ʽ�����ַ���
	 * @return �Ϸ������ݿ��ַ���
	 */
	public static String toSql(String str) {
		if (str == null || str.equals("")) {
			return "";
		}

		String sql = new String(str);
		return strReplace(sql, "'", "''");
	}

	/**
	 * ���ַ���ת����GBK����
	 * 
	 * @param uniStr
	 * @return
	 */
	public static String toGb(String uniStr) {
		String gbStr = "";
		if (uniStr == null) {
			uniStr = "";
		}
		try {
			byte[] tempByte = uniStr.getBytes("ISO8859_1");
			gbStr = new String(tempByte, "GB2312");
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return gbStr;
	}

	/**
	 * ���ַ���ת����uincode����
	 * 
	 * @param gbStr
	 * @return
	 */
	public static String toUni(String gbStr) {
		String uniStr = "";
		if (gbStr == null) {
			gbStr = "";
		}
		try {
			byte[] tempByte = gbStr.getBytes("GB2312");
			uniStr = new String(tempByte, "ISO8859_1");
		} catch (Exception ex) {
		}
		return uniStr;
	}

	public static String toString(String gbStr) {
		return gbStr;
	}
}