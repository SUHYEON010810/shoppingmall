package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.memberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("MemberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService{

	@Resource(name="MemberDAO")
	private MemberDAO memberDAO;

	/* 로그인 */
	@Override
	public int selectlogin(memberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectlogin(vo);
	}


	/* 회원가입 */
	@Override
	public String InsertMember(memberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return  memberDAO.InsertMember(vo);
	}

	/* 아이디 중복 체크 */
	@Override
	public int idcheck(String u_id) {
		// TODO Auto-generated method stub
		return memberDAO.idcheck(u_id);
	}

	/* 회원 구분 */
	@Override
	public int selectmem_div(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectmem_div(u_id);
	}


}
