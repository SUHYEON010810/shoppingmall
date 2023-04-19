package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.memberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("MemberDAO")
public class MemberDAO extends EgovAbstractDAO{

	/* 로그인 */
	public int selectlogin(memberVO vo) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectlogin", vo);
	}

	/* 회원가입 */
	public String InsertMember(memberVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("memberDAO.insertMember", vo);
	}

	/* 아이디 중복체크 */
	public int idcheck(String u_id) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.idcheck", u_id);
	}

	/* 회원 구분 */
	public int selectmem_div(String u_id) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectmem_div", u_id);
	}


}
