import ceylon.html { Html }

"Represents a empty html template. Html-based templates can extends this class."
shared class HtmlTemplate() extends Template() {

	Html html => createHtml();

	
	shared actual String rendered => html.string;
	
	"This method is used to create the html template content. Subclasses will typically override this method."
	shared default Html createHtml() {
		return Html();
	}
	
}