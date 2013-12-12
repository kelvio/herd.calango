import ceylon.html { Html, Head, Body, H1 }

"Run the module `herd.calango`."
shared void run() {
	
	print(Index("Hello World!").rendered);
	
}

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

class Index(String title) extends MyBaseTemplate() {


	shared actual Head createHead() {
		return Head { title = title; id = "myId"; headChildren = empty; };
	}
	
	shared actual Body createBody() {
		return Body { children = [ H1 { text = "MyBody"; } ]; };
		
	}

}