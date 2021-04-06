package com.kh.spring.admin.model.vo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TreeModel {
	private String id;         // 부모
    private String pId;        // 자식
    private String name;       // 트리이름
    private String open;       // 트리 OPEN 여부, true/false
    private String isParent;   // 부모 여부, true/false
    
    public TreeModel(String id, String pId, String name, String open, String isParent) {
        super();
        this.id = id;
        this.pId = pId;
        this.name = name;
        this.open = open;
        this.isParent = isParent;
    }
	
}
