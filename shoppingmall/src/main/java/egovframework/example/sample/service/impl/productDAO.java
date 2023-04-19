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

}
