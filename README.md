# Calango : A strongly typed text-based template engine for ceylon.
=======

The Calango is a Ceylon language module that implements a  template engine for text rendering.

Build on top of
* ceylon.html

Current deployed version 0.1.0, read the module [Documentation](https://modules.ceylon-lang.org/repo/1/calango/0.1.0).

A html template is created with one step:

HtmlTemplate htmlTemplate = HtmlTemplate();

You will usually create their own templates. You can do the following:

	class MyBaseTemplate() extends HtmlTemplate() {
	}

You certainly want each template has a specific content. 
The template has a class called createHtml() method that you can override to create the template content.

	import ceylon.html { Html }
	class MyBaseTemplate() extends HtmlTemplate() {
		shared actual Html createHtml() {
			return Html {};
		}
	}

If you need to customize specific elements of your template, you can delegate this task to a method whatsoever.

	import ceylon.html { Html, Head, Body }
	class MyBaseTemplate() extends HtmlTemplate() {
		shared actual Html createHtml() {
			return Html { 
				head = createHead(); 
				body = createBody(); 
				id = "myHtml"; 
			};
		}
	
		shared default Head createHead() {
			return Head();
		}
	
		shared default Body createBody() {
			return Body();
		}
	}

You can also extend templates and customize the base template:

	import ceylon.html { Html, Head, Body, H1 }
	class Index(String title) extends MyBaseTemplate() {
		shared actual Head createHead() {
			return Head { title = title; id = "myId"; headChildren = empty; };
		}	
		shared actual Body createBody() {
			return Body { children = [ H1 { text = "MyBodyHeader"; } ]; };	
		}
	}

You can get the contents of a template rendered by obtaining the value of the property "rendered", as follows:

	shared void run() {
		print(Index("Hello").rendered);
	}

This will generate the following output:

    <!DOCTYPE html>
	<html id="myHtml">
    	<head id="myId">
        	<title>
            	Hello
  	      </title>
  	  </head>
    	<body>
        	<h1>
            	MyBodyHeader
    	    </h1>
   	 	</body>
	</html>
