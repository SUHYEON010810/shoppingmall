package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.productService;
import egovframework.example.sample.service.productVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("productService")
public class productServiceImpl extends EgovAbstractServiceImpl implements productService{

	@Resource(name="productDAO")
	private productDAO productDAO;

	@Override
	public String InsertProduct(productVO vo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.InsertProduct(vo);
	}

}
