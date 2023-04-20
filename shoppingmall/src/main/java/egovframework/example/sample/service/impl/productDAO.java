package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.productVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("productDAO")
public class productDAO extends EgovAbstractDAO{

	/* 상품 추가 */
	public String InsertProduct(productVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("productDAO.InsertProduct", vo);
	}

	/* 상품 리스트 */
	public List<?> SelectproductList(productVO vo) {
		// TODO Auto-generated method stub
		return list("productDAO.SelectproductList", vo);
	}

	/* 상품 상세 정보 */
	public productVO seleteproductData(int prodnum) {
		// TODO Auto-generated method stub
		return (productVO) select("productDAO.seleteproductData", prodnum);
	}

	/*상품 삭제*/
	public int productDelect(int prodnum) {
		// TODO Auto-generated method stub
		return (int) delete("productDAO.productDelect",prodnum);
	}

	/* 상품 수정 */
	public int updateproduct(productVO vo) {
		// TODO Auto-generated method stub
		return (int) update("productDAO.updateproduct", vo);
	}

	/*상품 토탈 갯수*/
	public int selectTotal(productVO vo) {
		// TODO Auto-generated method stub
		return (int) select("productDAO.selectTotal",vo);
	}

}
