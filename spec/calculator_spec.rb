require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Calculator do
  it "should require one of three given operators" do
    %w{+ - *}.each do |op|
      lambda { Calculator.new(1, 1, op) }.should_not raise_error
    end    
  end
  
  it "should fail when given invalid operator" do
    lambda { Calculator.new(1, 1, 1) }.should raise_error
  end
  
  it "should require numbers for first two arguments" do
    lambda { Calculator.new(1, "foo", "+") }.should raise_error
    lambda { Calculator.new("foo", 1, "+") }.should raise_error
    lambda { Calculator.new("foo", "bar", "+") }.should raise_error
  end
  
  context "calculating" do
    it "should add given numbers" do
      calc = Calculator.new(1, 1, "+")
      calc.add
      calc.result.should == 2
    end
    
    it "should substract given numbers" do
      calc = Calculator.new(2, 1, "-")
      calc.substract
      calc.result.should == 1
    end
    
    it "should multiply given numbers" do
      calc = Calculator.new(2, 4, "*")
      calc.multiply
      calc.result.should == 8
    end
  end
  
  context "output" do
    it "should calculate length of the longest number including the op" do
      calc = Calculator.new(10, 100, "+")
      calc.output.map(&:length).max.should == 4
      
      Calculator.new(1000, 10, "+").output.map(&:length).max.should == 4
    end
  
  end
  
end