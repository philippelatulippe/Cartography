import Cartography

import Nimble
import Quick

class DimensionSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            view = TestView(frame: CGRect.zero)
            window.addSubview(view)
        }

        describe("LayoutProxy.width") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.width == view.superview!.width
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(400))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.width <= view.superview!.width
                    view.width >= view.superview!.width
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(400))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.width == view.superview!.width + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(500))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.width == view.superview!.width - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(300))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.width == view.superview!.width * 2
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(800))
            }

            it("should support division") {
                constrain(view) { view in
                    view.width == view.superview!.width / 2
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(200))
            }

            it("should support complex expressions") {
                constrain(view) { view in
                    view.width == view.superview!.width / 2 + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(300))
            }

            it("should support numerical equalities") {
                constrain(view) { view in
                    view.width == 200
                }

                window.layoutIfNeeded()

                expect(view.frame.width).to(equal(200))
            }
        }

        describe("LayoutProxy.height") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.height == view.superview!.height
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(400))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.height <= view.superview!.height
                    view.height >= view.superview!.height
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(400))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.height == view.superview!.height + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(500))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.height == view.superview!.height - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(300))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.height == view.superview!.height * 2
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(800))
            }

            it("should support division") {
                constrain(view) { view in
                    view.height == view.superview!.height / 2
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(200))
            }

            it("should support complex expressions") {
                constrain(view) { view in
                    view.height == view.superview!.height / 2 + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(300))
            }

            it("should support numerical equalities") {
                constrain(view) { view in
                    view.height == 200
                }

                window.layoutIfNeeded()

                expect(view.frame.height).to(equal(200))
            }
        }

#if os(iOS) || os(tvOS)
        describe("on iOS only") {
            beforeEach {
                window.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            if #available(iOS 11.0, *) {
                describe("LayoutProxy.safeArea.width") {
                    it("should support relative equalities") {
                        constrain(view) { view in
                            view.width == view.superview!.safeArea.width
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(400))
                    }

                    it("should support relative inequalities") {
                        constrain(view) { view in
                            view.width <= view.superview!.safeArea.width
                            view.width >= view.superview!.safeArea.width
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(400))
                    }

                    it("should support addition") {
                        constrain(view) { view in
                            view.width == view.superview!.safeArea.width + 100
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(500))
                    }

                    it("should support subtraction") {
                        constrain(view) { view in
                            view.width == view.superview!.safeArea.width - 100
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(300))
                    }

                    it("should support multiplication") {
                        constrain(view) { view in
                            view.width == view.superview!.safeArea.width * 2
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(800))
                    }

                    it("should support division") {
                        constrain(view) { view in
                            view.width == view.superview!.safeArea.width / 2
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(200))
                    }

                    it("should support complex expressions") {
                        constrain(view) { view in
                            view.width == view.superview!.safeArea.width / 2 + 100
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(300))
                    }

                    it("should support numerical equalities") {
                        constrain(view) { view in
                            view.width == 200
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.width).to(equal(200))
                    }
                }

                describe("LayoutProxy.height") {
                    it("should support relative equalities") {
                        constrain(view) { view in
                            view.height == view.superview!.safeArea.height
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(400))
                    }

                    it("should support relative inequalities") {
                        constrain(view) { view in
                            view.height <= view.superview!.safeArea.height
                            view.height >= view.superview!.safeArea.height
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(400))
                    }

                    it("should support addition") {
                        constrain(view) { view in
                            view.height == view.superview!.safeArea.height + 100
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(500))
                    }

                    it("should support subtraction") {
                        constrain(view) { view in
                            view.height == view.superview!.safeArea.height - 100
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(300))
                    }

                    it("should support multiplication") {
                        constrain(view) { view in
                            view.height == view.superview!.safeArea.height * 2
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(800))
                    }

                    it("should support division") {
                        constrain(view) { view in
                            view.height == view.superview!.safeArea.height / 2
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(200))
                    }

                    it("should support complex expressions") {
                        constrain(view) { view in
                            view.height == view.superview!.safeArea.height / 2 + 100
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(300))
                    }

                    it("should support numerical equalities") {
                        constrain(view) { view in
                            view.height == 200
                        }

                        window.layoutIfNeeded()

                        expect(view.frame.height).to(equal(200))
                    }
                }
            }
        }
#endif
    }
}
