describe('convert to something',function(){
	it("throws an error when passed an unknown from-unit", function () {
    var testFn = function () {
        Convert(1, "dollar").to("yens");
    }
    expect(testFn).toThrow(new Error("unrecognized from-unit"));
	});
});
describe( "distance converter", function () {
    it("converts inches to centimeters", function () {
        expect(Convert(12, "inches").to("cm")).toEqual(30.48);
    });

    it("converts centimeters to yards", function () {
        expect(Convert(2000, "cm").to("yards")).toEqual(21.87);
    });
});