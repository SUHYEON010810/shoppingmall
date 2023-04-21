package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.QnAVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("QnADAO")
public class QnADAO  extends EgovAbstractDAO{

	public List<?> SelectproductList(QnAVO vo) {
		// TODO Auto-generated method stub
		return list("QnADAO.SelectproductList", vo);
	}

	public String InsertQnA(QnAVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("QnADAO.InsertQnA", vo);
	}

	public List<?> SelectQnAList(QnAVO vo) {
		// TODO Auto-generated method stub
		return list("QnAVO.SelectQnAList", vo);
	}

	public QnAVO seleteQnAData(int qseq) {
		// TODO Auto-generated method stub
		return (QnAVO) select("QnAVO.seleteQnAData", qseq);
	}

}
