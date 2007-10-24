# $Author: ddumont $
# $Date: 2007-10-24 16:00:10 $
# $Name: not supported by cvs2svn $
# $Revision: 1.2 $

#    Copyright (c) 2007 Dominique Dumont.
#
#    This file is part of Config-Model-Itself.
#
#    Config-Model-Itself is free software; you can redistribute it
#    and/or modify it under the terms of the GNU Lesser Public License
#    as published by the Free Software Foundation; either version 2.1
#    of the License, or (at your option) any later version.
#
#    Config-Model-Itself is distributed in the hope that it will be
#    useful, but WITHOUT ANY WARRANTY; without even the implied
#    warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU Lesser Public License for more details.
#
#    You should have received a copy of the GNU Lesser Public License
#    along with Config-Model-Itself; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA

[
  [
   name => "Itself::Class",

   class_description => "Configuration class. This class will contain elements",

   'element' 
   => [

       'element' => {
		     type       => 'hash',
		     level      => 'important',
		     cargo_type => 'node',
		     ordered    => 1,
		     index_type => 'string',
		     config_class_name => 'Itself::Element',
		    },

       'include' => { type => 'leaf',
		      value_type => 'reference',
		      refer_to => '! class',
		    } ,

       'include_after' => { type => 'leaf',
			    value_type => 'reference',
			    refer_to => '- element',
			  } ,

       'class_description'
       => { 
	   type => 'leaf',
	   value_type => 'string' ,
	  },

       [qw/generated_by write_config_dir read_config_dir/]
       => { 
	   type => 'leaf',
	   value_type => 'uniline' ,
	  },

       'read_config'
       => {
	   type => 'list',
	   cargo_type => 'node',
	   config_class_name => 'Itself::ConfigWR',
	  },
       'write_config'
       => {
	   type => 'node',
	   config_class_name => 'Itself::ConfigWR',
	  },

      ],

   'description' 
   => [
       element => "Specify the elements names of this configuration class.",
       include => "Include the specification of another class into this class.",
       include_after => "insert the included elements after a specific element" ,
       class_description => "Explain the purpose of this configuration class",
       write_config_dir => "Specify where to write configuration data",
       read_config_dir => "Specify where to write configuration data",
       read_config => "Specify the Perl class and function used to read configuration data" ,
       write_config => "Specify the Perl class and function used to write configuration data" ,
      ],
  ],
  [
   name => "Itself::ConfigWR",

   'element' 
   => [

       [qw/function class/]
       => { 
	   type => 'leaf',
	   value_type => 'uniline' ,
	  },

      ],

  ],

];
