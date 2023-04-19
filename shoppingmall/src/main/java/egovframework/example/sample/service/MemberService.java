package egovframework.example.sample.service;

public interface MemberService {
	/* 로그인 */
	int selectlogin(memberVO vo) throws Exception;

	/* 회원가입 */
	String InsertMember(memberVO vo) throws Exception;

	/* 중복 체크 */
	int idcheck(String u_id)throws Exception;

	/* 회원 구분 */
	int selectmem_div(String u_id)throws Exception;



}
