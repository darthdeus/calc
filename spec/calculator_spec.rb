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
      calc = Calculator.new(1, 1, "+").calculate
      calc.result.should == 2
    end
    
    it "should substract given numbers" do
      calc = Calculator.new(2, 1, "-").calculate
      calc.result.should == 1
    end
    
    it "should multiply given numbers" do
      calc = Calculator.new(2, 4, "*").calculate
      calc.result.should == 8
    end
  end
  
  context "output" do
    it "should calculate length of the longest number including the op" do
      calc = Calculator.new(10, 100, "+").calculate
      calc.output.map(&:length).max.should == 4
      
      Calculator.new(1000, 10, "+").calculate.output.map(&:length).max.should == 4
    end

    it "should display detailed multiplication" do
      calc = Calculator.new(10, 10, "*").calculate
      calc.output[3].to_i.should == 0
      calc.output[4].to_i.should == 10
      calc.output.last.to_i.should == 100
    end

    it "should calculate underline size based on the longest line" do
      examples = [
        [10, 10, 3],
        [100, 10, 4],
        [10, 100, 4]
      ]
      examples.each do |example|
        Calculator.new(example[0], example[1], "*").calculate.total_width.should == example.last  
      end
    end
  end
    
end