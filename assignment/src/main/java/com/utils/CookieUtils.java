package com.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	public static Cookie add(String name, String value, int hours, HttpServletResponse respond) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours * 60 * 60);
		cookie.setPath("/");
		respond.addCookie(cookie);
		return cookie;
	}

	public static String get(String name, HttpServletRequest request) {
		Cookie ck[] = request.getCookies();
		if (ck != null) {
			for (Cookie k : ck) {
				if (k.getName().equalsIgnoreCase(name)) {
					return k.getValue();
				}
			}
		}
		return "";
	}

}
