package kr.or.ddit.enumpkg;

//enum도 하나의 객체이다. class는 변수도, 상수도, 모두 가능하다.
//그런데 enum은 상수만 가능하며, 자기타입으로 제한된다.(1.5버전부터 출시됨)
//public class BrowserType {
//	public static final BrowserType CHROME = new BrowserType();
//	public static final BrowserType EDG = new BrowserType();
//	private BrowserType(){}
//}

	public enum BrowserType {
		EDG("엣지"), CHROME("크롬"), SAFARI("사파리"), OTHER("기타");
		private BrowserType(String name) {
			this.browserName = name;
		}
		private String browserName;
		
		public String getBrowserName() {
			return browserName;
	}
	
	public static BrowserType findBrowser(String agent) {
		agent = agent == null? "" : agent.toUpperCase();
		BrowserType retValue = OTHER;
		for(BrowserType tmp : values()) {
			if(agent.contains(tmp.name())) {
				retValue = tmp;
			}
		}
		return retValue;
	}
	
	public static String findBrowserName(String agent) {
		return findBrowser(agent).getBrowserName();
	}
}
