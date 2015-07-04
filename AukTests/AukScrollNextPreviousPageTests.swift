import UIKit
import XCTest
import moa

class AukScrollNextPreviousPageTests: XCTestCase {
  
  var scrollView: UIScrollView!
  var auk: AukInterface!
  
  override func setUp() {
    super.setUp()
    
    scrollView = UIScrollView()
    
    // Set scroll view size
    let size = CGSize(width: 120, height: 90)
    scrollView.bounds = CGRect(origin: CGPoint(), size: size)
    
    auk = Auk(scrollView: scrollView)
  }
  
  // MARK: - Scroll to next page
  
  func testScrollToNextPage() {
    let image = uiImageFromFile("96px.png")
    auk.show(image: image)
    auk.show(image: image)
    auk.show(image: image)
    
    auk.scrollToNextPage()
    XCTAssertEqual(1, auk.currentPageIndex)
    
    auk.scrollToNextPage()
    XCTAssertEqual(2, auk.currentPageIndex)
    
    auk.scrollToNextPage()
    XCTAssertEqual(0, auk.currentPageIndex)
  }
  
  func testScrollToNextPage_withParameters_cycle() {
    let image = uiImageFromFile("96px.png")
    auk.show(image: image)
    auk.show(image: image)
    auk.show(image: image)
    
    auk.scrollToNextPage(cycle: true, animated: true)
    XCTAssertEqual(1, auk.currentPageIndex)
    
    auk.scrollToNextPage(cycle: true, animated: true)
    XCTAssertEqual(2, auk.currentPageIndex)
    
    auk.scrollToNextPage(cycle: true, animated: true)
    XCTAssertEqual(0, auk.currentPageIndex)
  }
  
  func testScrollToNextPage_withParameters_noCycle() {
    let image = uiImageFromFile("96px.png")
    auk.show(image: image)
    auk.show(image: image)
    auk.show(image: image)
    
    auk.scrollToNextPage(cycle: false, animated: true)
    XCTAssertEqual(1, auk.currentPageIndex)
    
    auk.scrollToNextPage(cycle: false, animated: true)
    XCTAssertEqual(2, auk.currentPageIndex)
    
    auk.scrollToNextPage(cycle: false, animated: true)
    XCTAssertEqual(2, auk.currentPageIndex)
  }
  
  // MARK: - Scroll to previous page
  
  func testScrollToPreviousPage() {
    let image = uiImageFromFile("96px.png")
    auk.show(image: image)
    auk.show(image: image)
    auk.show(image: image)
    
    auk.scrollToPreviousPage()
    XCTAssertEqual(2, auk.currentPageIndex)
    
    auk.scrollToPreviousPage()
    XCTAssertEqual(1, auk.currentPageIndex)
    
    auk.scrollToPreviousPage()
    XCTAssertEqual(0, auk.currentPageIndex)
  }
  
  func testScrollToPreviousPage_withParameters_cycle() {
    let image = uiImageFromFile("96px.png")
    auk.show(image: image)
    auk.show(image: image)
    auk.show(image: image)
    
    auk.scrollToPreviousPage(cycle: true, animated: true)
    XCTAssertEqual(2, auk.currentPageIndex)
    
    auk.scrollToPreviousPage(cycle: true, animated: true)
    XCTAssertEqual(1, auk.currentPageIndex)
    
    auk.scrollToPreviousPage(cycle: true, animated: true)
    XCTAssertEqual(0, auk.currentPageIndex)
  }
  
  func testScrollToPreviousPage_withParameters_noCycle() {
    let image = uiImageFromFile("96px.png")
    auk.show(image: image)
    auk.show(image: image)
    auk.show(image: image)
    
    auk.scrollTo(2, animated: false)
    
    auk.scrollToPreviousPage(cycle: false, animated: true)
    XCTAssertEqual(1, auk.currentPageIndex)
    
    auk.scrollToPreviousPage(cycle: false, animated: true)
    XCTAssertEqual(0, auk.currentPageIndex)
    
    auk.scrollToPreviousPage(cycle: false, animated: true)
    XCTAssertEqual(0, auk.currentPageIndex)
  }

}