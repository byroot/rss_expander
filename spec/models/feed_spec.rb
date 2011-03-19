require 'spec_helper'

describe Feed do
  
  fixtures :feeds
  
  subject{ feeds(:secouchermoinsbete) }
  
  its(:name) { should == "secouchermoinsbete.fr" }
  
  its(:url) { should == "http://feeds.feedburner.com/SecouchermoinsbetefrAnecdotes" }
  
  its(:selector) { should == '#content .mainBlock .blockMiddle' }
  
end
