package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.productVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("productDAO")
public class productDAO extends EgovAbstractDAO{

	public String InsertProduct(productVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("productDAO.InsertProduct", vo);
	}

}
