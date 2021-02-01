/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.dtos;

import java.io.Serializable;

/**
 *
 * @author leean
 */
public class CategoryDTO implements Serializable{
 private String cateID;
 private String cateName;
 private String cateDes;

    public CategoryDTO(String CateID, String CateName, String CateDes) {
        this.cateID = CateID;
        this.cateName = CateName;
        this.cateDes = CateDes;
    }

    public CategoryDTO() {
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String CateID) {
        this.cateID = CateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String CateName) {
        this.cateName = CateName;
    }

    public String getCateDes() {
        return cateDes;
    }

    public void setCateDes(String CateDes) {
        this.cateDes = CateDes;
    }
 
}
