 package com.recruitmentportal.DTO;

import com.recruitmentportal.entity.InvolveTechPanelTable;
 
 
 public class tlhelper
 {
   
  
   private UserDTO user;
   private InvolveTechPanelTable involvepanel;
   
   
   
   public InvolveTechPanelTable getInvolvepanel() {
     return this.involvepanel;
   }
   
   public void setInvolvepanel(InvolveTechPanelTable involvepanel) {
     this.involvepanel = involvepanel;
   }

   public UserDTO getUser() {
	return user;
}

   public void setUser(UserDTO user) {
	this.user = user;
}
   
 }


