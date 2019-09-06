package org.bsxf.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.joda.time.Minutes;
import org.joda.time.Months;
import org.joda.time.Seconds;
import org.joda.time.Years;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class DateUtil {
	public static void main(String[] args) {
		//System.out.println(formatDateToStringII(new Date()));
		Calendar c = Calendar.getInstance();

		System.out.println(c.get(Calendar.MONTH));
	}

	public Integer[] getBetwenHourAndMuilt() {
		return null;
	}

	public static Date getWeekFirstDay(Date date) {
		DateTime sdt = new DateTime(date);
		//Property p = sdt.dayOfWeek();
		int i = sdt.getDayOfWeek();
		return sdt.plusDays(1 - i).toDate();

	}

	/**
	 * yyyy-MM-dd HH:mm:ss
	 * */
	public static String formatDateToStringE(Date d) {
		String format = "yyyy年MM月dd日 E";
		return formatDateToStringByFormat(d, format);
	}

	/**
	 * yyyy-MM-dd HH:mm:ss
	 * */
	public static String formatDateToString(Date d) {
		String format = "yyyy-MM-dd HH:mm:ss";
		return formatDateToStringByFormat(d, format);
	}

	/**
	 *  
	 * */
	public static String formatDateToStringByFormat(Date d, String format) {
		DateTime fooDate = new DateTime(d);
		return fooDate.toString(format);
	}

	/**
	 * yyyy-MM-dd
	 * */
	public static String formatDateToStringII(Date d) {
		String format = "yyyy-MM-dd";
		return formatDateToStringByFormat(d, format);
	}

	/**
	 * date:2013-6-28
	 * */
	public static Date StringToDate(String date) {
		DateTime dt = new DateTime(date);
		return dt.toDate();
	}

	/**
	 * date:2013-6-28 9:23:55
	 * */
	public static Date StringTimeToDate(String date) {
		date = date.trim().replaceAll(" ", "T");
		DateTime dt = new DateTime(date);
		return dt.toDate();
	}

	/**
	 * style:"SS" ,"MM","LL", "FF
	 * lang:zh,en
	 **/
	public static String formatDateTime(DateTime dateTime, String style, String lang) {
		DateTimeFormatter formatter = DateTimeFormat.forStyle(style).withLocale(new Locale(lang));
		return dateTime.toString(formatter);
	}

	/**
	 * 两个日期的相隔天数
	 * */
	public static int betweenDays(Date startDate, Date endDate) {
		return betweens(startDate, endDate, "day");
	}

	/**
	 * 两个日期的相隔小时数
	 * */
	public static int betweenHours(Date startDate, Date endDate) {
		return betweens(startDate, endDate, "hour");
	}

	/**
	 * 两个日期的相隔分钟数
	 * */
	public static int betweenMinutes(Date startDate, Date endDate) {
		return betweens(startDate, endDate, "m");
	}

	private static int betweens(Date startDate, Date endDate, String type) {
		DateTime sdt = new DateTime(startDate);
		DateTime edt = new DateTime(endDate);
		if (type.equals("year"))
			return Years.yearsBetween(sdt, edt).getYears();
		else if (type.equals("month"))
			return Months.monthsBetween(sdt, edt).getMonths();
		else if (type.equals("day"))
			return Days.daysBetween(sdt, edt).getDays();
		else if (type.equals("hour"))
			return Hours.hoursBetween(sdt, edt).getHours();
		else if (type.equals("m"))
			return Minutes.minutesBetween(sdt, edt).getMinutes();
		else if (type.equals("s"))
			return Seconds.secondsBetween(sdt, edt).getSeconds();
		return 0;
	}

	/**
	 * 取得月份的头一天和最后一天.
	 * 取得一天的0:00和23:59:59
	 * 其他如年，星期的头一天，最后一天同理可证
	 */
	public void beginAndEndOfDates() {
		String dateString = "1978-06-10T12:10:08";
		DateTime dt = new DateTime(dateString);
		DateTime startOfMonth = dt.dayOfMonth().withMinimumValue().withTimeAtStartOfDay();
		System.out.println(startOfMonth.toString());

		DateTime endOfMonth = dt.dayOfMonth().withMaximumValue().millisOfDay().withMaximumValue();
		System.out.println(endOfMonth);
	}

	/**
	 * 演示日期的加钱以及计算日期间的间隔，可使用任意时间单位进行加减和计算间隔.
	 */
	public void daysPlusAndMinusBetweenAndBetweenx() {
		DateTime now = new DateTime();
		DateTime birthDate = now.minusYears(10);
		birthDate = now.minusYears(10).plusDays(2);
	}

	public static String getMonth(Date d) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		return df.format(d);
	}

	public static String getCurrentMonth() {
		return getMonth(new Date());

	}
	
	// 增加或减少几个月
	public static Date addMonth(Date date, int num) {
	   Calendar startDT = Calendar.getInstance();
	   startDT.setTime(date);
	   startDT.add(Calendar.MONTH, num);
	   return startDT.getTime();
	}
	// 增加或减少天数
	public static Date addDay(Date date, int num) {
	   Calendar startDT = Calendar.getInstance();
	   startDT.setTime(date);
	   startDT.add(Calendar.DAY_OF_MONTH, num);
	   return startDT.getTime();
	}
}
