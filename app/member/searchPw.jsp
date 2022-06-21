<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<jsp:useBean id="dao" class="com.treatTrip.app.member.dao.MemberDAO"></jsp:useBean>

<%!
public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
  PasswordAuthentication pa;
  public MyAuthentication(){
    pa=new PasswordAuthentication("treattrip123@gmail.com","trip789!!!");        
  }
  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return pa;
  }
}
%>

<%
 // SMTP 서버 주소
 String smtpHost = "smtp.gmail.com";

 //받는 사람의 정보
 String toEmail = (String)session.getAttribute("mailAddr");
 String member_id = (String)session.getAttribute("mailId");
 
 //보내는 사람의 정보
 String fromName = "트릿트립";
 String fromEmail = "treattrip123@gmail.com";
 String tmp_pw = "";
 
 try {
  Properties props = new Properties();
props.put("mail.smtp.user", fromEmail);
props.put("mail.smtp.host", "smtp.googlemail.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

  // 메일 인증
  Authenticator myauth=new MyAuthentication(); 
  Session sess=Session.getInstance(props, myauth);


  InternetAddress addr = new InternetAddress();
  addr.setPersonal(fromName,"UTF-8");
  addr.setAddress(fromEmail);

	String st[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P",
					"Q","R","S","T","U","V","W","X","Y","Z"};
	Random r = new Random();
	for(int i=1; i<=6; i++) {
		tmp_pw += st[r.nextInt(26)];
	}
  
  
  
  

  Message msg = new MimeMessage(sess);
  msg.setFrom(addr);         
  msg.setSubject(MimeUtility.encodeText("[treattrip] " + member_id + "님의 임시 비밀번호입니다.", "utf-8","B"));
  msg.setContent("안녕하세요 Treat Trip입니다.<br/>"
  				+member_id + "님의 임시 비밀번호는 <b>"+tmp_pw+"</b>입니다.<br/>위의 임시 비밀번호로 로그인 후 비밀번호를 다시 변경해주세요^^<br/>감사합니다.", 
  				"text/html;charset=utf-8");
  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

  Transport.send(msg);

  
  
 } catch (Exception e) {
  e.printStackTrace();
  
  %>
  	<script>
	  	alert("메일 전송에 실패했습니다.\n다시 시도해주세요.");
	  	history.go(-1);
  	</script>
  <%
  return;
 }
 
 if(dao.updateTmpPw(member_id, tmp_pw)){
  %>
  	<script>
	  	alert("메일 발송 완료\n받은 메일을 확인해주세요.");
	  	history.go(-1);
  	</script>
	 
<%
 }
 
%>	 
 
 
