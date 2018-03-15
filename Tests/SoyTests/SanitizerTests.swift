import XCTest
@testable import Soy

class SanitizersTests: XCTestCase {
    func testTagWhitelisting() {
        XCTAssertTrue(cleanHtml("<b>Hello, World!</b>") == "<b>Hello, World!</b>")
        XCTAssertTrue(cleanHtml("<b onclick='evil()'>Hello, World!</b>") == "<b>Hello, World!</b>")
        XCTAssertTrue(cleanHtml("<b>Hello, <br/> World!</b>") == "<b>Hello, <br> World!</b>")
        // Don't add end tags for void elements.
        XCTAssertTrue(cleanHtml("<b>Hello, <br/> World!") == "<b>Hello, <br> World!</b>")
        XCTAssertTrue(cleanHtml("<b>Hello, <br> World!") == "<b>Hello, <br> World!</b>")
        // Missing open tag.
        XCTAssertTrue(cleanHtml("Hello, <br/> World!") == "Hello, <br> World!")
        // A truncated tag is not a tag.
        XCTAssertTrue(cleanHtml("Hello, <br") == "Hello, &lt;br")
        // Test boundary conditions at end of input.
        XCTAssertTrue(cleanHtml("Hello, <") == "Hello, &lt;")
        XCTAssertTrue(cleanHtml("Hello, </") == "Hello, &lt;/")
        XCTAssertTrue(cleanHtml("Hello, < World") == "Hello, &lt; World")
        // Don't be confused by attributes that merge into the tag name.
        XCTAssertTrue(cleanHtml("<img/onload=alert(1337)>") == "")
        XCTAssertTrue(cleanHtml("<i/onmouseover=alert(1337)>foo</i>") == "foo")
        XCTAssertTrue(cleanHtml("A<img/onload=alert(1337)>B") == "AB")
        // Don't create new tags from parts that were not originally adjacent.
        XCTAssertTrue(cleanHtml("<<img/onload=alert(1337)>img onload=alert(1337)") == "&lt;img onload=alert(1337)")
        // Test external layout breakers.
        // <ul><li>Foo</ul></li> would be bad since it is equivalent to
        // <ul><li>Foo</li></ul></li>
        XCTAssertTrue(cleanHtml("<ul><li>Foo</ul>") == "<ul><li>Foo</li></ul>")
        // We put the close tags in the wrong place but in a way that is safe.
        XCTAssertTrue(cleanHtml("<ul><li>1<li>2</ul>") == "<ul><li>1<li>2</li></li></ul>")
        XCTAssertTrue(cleanHtml("<table><tr><td>") == "<table><tr><td></td></tr></table>")
        // Don't merge content around tags into an entity.
        XCTAssertTrue(cleanHtml("&<hr>amp;") == "&amp;amp;")
    }

    func testCleanHtml() {
        XCTAssertTrue(cleanHtml("<em>f<object>oo</em>") == ordainAsSafe("<em>foo</em>", ContentKind.HTML))
        XCTAssertTrue(cleanHtml("<em>f<object>oo</em>")
            == ordainAsSafe("<em>foo</em>", ContentKind.HTML))
        XCTAssertTrue(
            cleanHtml(
                ordainAsSafe("<em>f<object>oo</em>", ContentKind.CSS))
            ==
                ordainAsSafe("<em>foo</em>", ContentKind.HTML /*, Dir.LTR */))

        // Input of ContentKind.HTML is left alone.
        XCTAssertTrue(
            cleanHtml(ordainAsSafe("<script>notevil()</script>", ContentKind.HTML))
            == ordainAsSafe("<script>notevil()</script>", ContentKind.HTML))
    }



    static var allTests = [
        ("testTagWhitelisting", testTagWhitelisting),
        ("testCleanHtml", testCleanHtml)
    ]
}
