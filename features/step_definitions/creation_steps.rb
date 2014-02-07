# Since we're using the glorious aruba gem this has become unable to
# pass the kataname to aruba steps, oh well...
Given /^I wish to create a kata for (.+)$/ do |kataName|
  @kataName = kataName
end

