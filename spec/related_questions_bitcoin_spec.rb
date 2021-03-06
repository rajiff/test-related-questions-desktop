describe "SerpApi Desktop JSON" do

  describe "Related Questions for Bitcoin (emoji 👏 issue)" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=How+do+you+earn+bitcoins%3F&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["related_questions"]).to be_an(Array)
    end

    describe "have \"How can I earn Bitcoins for free?\" question" do

      before :all do
        @question = @json["related_questions"].detect{|e| e["question"] == "How can I earn Bitcoins for free?"}
      end

      it "has correct title" do
        expect(@question["title"]).to eql("Earn Bitcoins in 8 different ways")
      end

      it "links cprrect website" do
        expect(@question["link"]).to eql("http://earn-bitcoins.com/")
      end

      it "has a snippet" do 
        expect(@question["snippet"]).to_not be_empty
      end

      it "includes 👏 emoji" do 
        expect(@question["snippet"]).to include("👏")
      end

    end

  end

end
