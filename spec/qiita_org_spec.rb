RSpec.describe QiitaOrg do
  it "has a version number" do
    expect(QiitaOrg::VERSION).not_to be nil
  end
end

RSpec.describe QiitaPost do
  before :each do
    @post = QiitaPost.new('test','hoge')
  end

  it "select right option" do
    [['qiita',["https://qiita.com/", false]],
     ["private", ["https://qiita.com/", true]],
     [nil, ["https://qiita.com/", true]],
     ["teams", ['https://nishitani.qiita.com/', false]], # nishitani is specified
     ["open",["https://qiita.com/", false]],
     ["public",["https://qiita.com/", false]],
     ].each do |val,res|
      p [val,res]
      expect(@post.select_option(val)).to eq res
    end
  end
  it "raise RuntimeError if select gets wrong option" do
    expect{@post.select_option('hoge')}.to raise_error(RuntimeError)
  end
end
