defmodule AndamioWeb.CreateBigCompanyTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature
  import Wallaby.Browser

  feature "User creates a Big Company", %{session: session} do
    session
    |> visit("/businesses")
    |> assert_has(Query.css("body", text: "These are your Big Companies"))
    |> click(Query.button("New Business"))
    |> fill_in(Query.text_field("Name"), with: "My startup")
    |> click(Query.button("Save Business"))
    |> assert_has(Query.text("My startup"))

    session
    |> click(Query.button("Edit Business Model Canvas"))
    |> fill_in(Query.text_field("Business Model Canvas"), with: "
           Business Idea: EcoCourier – Sustainable Package Delivery A courier service that exclusively uses electric bikes and renewable energy-powered micro-hubs to provide eco-friendly and efficient deliveries, catering to businesses and individuals aiming to reduce their carbon footprint.
           1. Key Partners
           - Local governments supporting sustainability initiatives
           - Renewable energy providers
           - Bike manufacturers specializing in cargo electric bikes
           - Sustainable packaging suppliers
           - E-commerce platforms and eco-conscious brands
           2. Key Activities
           - Last-mile delivery using electric bikes
           - Development and maintenance of solar-powered distribution hubs
           - Route optimization using AI for efficiency
           - Customer engagement and education on green logistics
           - Partnerships with businesses seeking sustainable delivery options
           3. Key Resources
           - Fleet of electric cargo bikes
           - Solar-powered micro-hubs
           - Skilled couriers and operational staff
           - AI-driven logistics software
           - Brand credibility as an eco-conscious delivery provider
           4. Value Propositions
           - 100% eco-friendly deliveries
           - Cost-effective and faster urban logistics
           - Improved brand image for businesses using green delivery solutions
           - Reduction of carbon footprint
           - Seamless tracking and customer service
           5. Customer Relationships
           - Personalized customer experience with flexible scheduling
           - Loyalty programs for frequent users
           - Transparent sustainability reports for corporate clients
           - Engaging social media showcasing green impact
           6. Channels
           - Online platform for orders and real-time tracking
           - Mobile app with interactive features
           - Partnerships with e-commerce brands for integrated shipping options
           - Physical kiosks for local package drop-offs
           7. Customer Segments
           - E-commerce businesses aiming for sustainable logistics
           - Local shops offering green delivery options
           - Environmentally conscious consumers
           - Corporate clients integrating sustainable supply chains
           8. Cost Structure
           - Maintenance of electric bike fleet and micro-hubs
           - Logistics software development and operation
           - Employee salaries and training
           - Marketing and brand awareness campaigns
           9. Revenue Streams
           - Subscription-based services for businesses
           - Pay-per-delivery model for individuals
           - Advertising partnerships with eco-conscious brands
           - Premium features (express delivery, custom packaging)
    ")
    |> click(Query.button("Save"))
    |> assert_has(Query.text("The canvas has been saved"))
  end
end
