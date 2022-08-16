package web.util;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class packages_CompositeQuery {
	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;

		if ("Departure".equals(columnName) || "Destination".equals(columnName)) {// 用於varchar

			aCondition = columnName + " like '%" + value + "%'";

		} else if ("Duration".equals(columnName)) {
			System.out.println(value);
			if (value.equals("1~5天") || value.equals("5")) {
				aCondition = "Duration" + "<=" + "5";
			} else if (value.equals("6~9天") || value.equals("10")) {
				aCondition = "Duration" + ">" + "5" + "&&" + "Duration" + "<" + "10";
			} else if (value.equals("10天以上") || value.equals("20")) {
				aCondition = "Duration" + ">" + "10";
			}

//			aCondition = "Duration" + ">=" + value;
		} else if ("DepartureTime".equals(columnName)) { // 用於date
			if (value.equals("請選擇啟航日期")) {
				aCondition = "";
			}

			aCondition = "Departure_Time" + " like '%" + value + "%'";
		} else if ("whichPage".equals(columnName)) {
			return "";
		}

		// aCondition = columnName + "=" + "'" + value + "'";
		// for 其它DB 的 date
//		    aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";  //for Oracle 的 date

		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			System.out.println(key + "====" + Arrays.toString(map.get(key)));
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0 && !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_myDB(key, value.trim());

				if (count == 1) {
					whereCondition.append(" where " + aCondition);
				} else {
					if (aCondition != "") {
						whereCondition.append(" and " + aCondition);
					}

				}

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}

		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳
		// java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();

		map.put("Duration", new String[] { "5" });
		map.put("Departure", new String[] { "台灣 基隆港" });
		map.put("Destination", new String[] { "台灣 基隆港" });
		map.put("Departure_Time", new String[] { "2022-08" });
		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key

		String finalSQL = "select * from Packages " + packages_CompositeQuery.get_WhereCondition(map)
				+ "order by Package_No";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}
