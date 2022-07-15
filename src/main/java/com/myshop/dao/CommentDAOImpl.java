package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CommentDTO;
import com.myshop.dto.ReCommentDTO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	private static final String namespace = "com.myshop.CommentMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<CommentDTO> CommentList(int board_seq) throws Exception {
		return sqlSession.selectList(namespace+".CommentList",board_seq);
	}

	@Override
	public void CommentAdd(CommentDTO DTO) throws Exception {
		sqlSession.insert(namespace+".CommentAdd",DTO);
		
	}

	@Override
	public void CommentEdit(CommentDTO DTO) throws Exception {
		sqlSession.update(namespace+".CommentEdit",DTO);
		
	}

	@Override
	public void CommentDel(int seq) throws Exception {
		sqlSession.delete(namespace+".CommentDel",seq);
		
	}

	@Override
	public void Comment_REC_UP(int seq) throws Exception {
		sqlSession.update(namespace+".Comment_REC_UP",seq);
		
	}

	@Override
	public void CommentDel_All(int board_seq) throws Exception {
		sqlSession.delete(namespace+".CommentDel_All",board_seq);
		
	}

	@Override
	public List<ReCommentDTO> Re_CommentList(int comment_seq) throws Exception {
		return sqlSession.selectList(namespace+".Re_CommentList",comment_seq);
	}

	@Override
	public void Re_CommentAdd(ReCommentDTO DTO) throws Exception {
		sqlSession.insert(namespace+".Re_CommentAdd",DTO);
		
	}

	@Override
	public void Re_CommentDel(int seq) throws Exception {
		sqlSession.delete(namespace+".Re_CommentDel",seq);
		
	}

	@Override
	public void Re_Comment_REC_UP(int seq) throws Exception {
		sqlSession.update(namespace+".Re_Comment_REC_UP",seq);
		
	}

	@Override
	public void RE_CommentDel_All(int comment_seq) throws Exception {
		sqlSession.delete(namespace+".Re_CommentDel_All",comment_seq);
		
	}

	
	
	

}
