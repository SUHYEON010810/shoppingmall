package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.QnAService;
import egovframework.example.sample.service.QnAVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("QnAService")
public class QnAServiceImpl extends EgovAbstractServiceImpl implements QnAService{

	@Resource(name="QnADAO")
	private QnADAO QnAdao;

	@Override
	public List<?> SelectproductList(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return  QnAdao.SelectproductList(vo);
	}

	@Override
	public String InsertQnA(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return QnAdao.InsertQnA(vo);
	}

	@Override
	public List<?> SelectQnAList(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return QnAdao.SelectQnAList(vo);
	}

	@Override
	public QnAVO seleteQnAData(int qseq) throws Exception {
		// TODO Auto-generated method stub
		return QnAdao.seleteQnAData(qseq);
	}

	@Override
	public int updateQnA(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return QnAdao.updateQnA(vo);
	}

	@Override
	public int deleteQnA(int qseq) throws Exception {
		// TODO Auto-generated method stub
		return QnAdao.deleteQnA(qseq);
	}

}
