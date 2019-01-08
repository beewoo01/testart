package net.my.subdao;

import net.my.sub.SubBoard;
import net.my.sub.SubUpload;

public interface SubDAO {

	public void create(SubUpload vo) throws Exception;
	public void taginsert(SubUpload vo) throws Exception; 

}
