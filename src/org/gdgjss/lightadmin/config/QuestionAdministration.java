package org.gdgjss.lightadmin.config;

import org.gdgjss.model.Questions;

import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.PersistentFieldSetConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.FieldSetConfigurationUnit;
import static org.lightadmin.api.config.utils.Editors.wysiwyg;
//import static org.lightadmin.api.config.utils.Editors.textArea;
 

public class QuestionAdministration extends AdministrationConfiguration<Questions>{
	
	 public FieldSetConfigurationUnit formView( final PersistentFieldSetConfigurationUnitBuilder fragmentBuilder ) {
	        return fragmentBuilder
	        		
	                .field("question").caption("Question").editor( wysiwyg() )
	                .field("optionA").caption("optionA")
	                .field("optionB").caption("optionB")
	                .field("optionC").caption("optionC")
	                .field("optionD").caption("optionD")
	                .field("answer").caption("answer").build();
	    }

}
