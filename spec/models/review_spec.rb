describe Review do
  let(:review) {Review.new}

  it "should belong to a game" do
    review = Review.reflect_on_association(:game)
    review.macro.should == :belongs_to
  end

  it "should belong to a reviewer" do
    review = Review.reflect_on_association(:reviewer)
    review.macro.should == :belongs_to
  end

  it "should create an invalid review" do
    rev = Review.new()
    expect(rev.valid?).to be false
  end

  it "should create a valid review" do
    rev = Review.new(fun_rating: 5, difficulty_rating: 5)
    expect(rev.valid?).to be true
  end

end