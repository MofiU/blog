module ApplicationHelper

  def header_logo
    link_to root_path, id: 'logo' do
      image_tag 'logo.png'
    end
  end

  def blog_card(href, title, meta, body, image_path = nil)
    header = content_tag :header do
              concat(image_tag image_path) if image_path
              concat(content_tag(:h3) { link_to title, href } )
              concat(content_tag(:span, meta, class: 'meta'))
              concat(content_tag(:hr))
            end

    body = content_tag(:div, body, class: 'body')

    footer =  content_tag :div, class: 'clearfix' do
                link_to "Read more", href, class: "btn btn-clean-one"
              end


    content_tag :article, class: "blog-teaser" do
      concat header
      concat body
      concat footer
    end.html_safe

  end

  def tags_card(tags)
    header = content_tag :header do
              content_tag :h3, "标签"
            end

    body = content_tag :div, class: 'body clearfix' do
             content_tag :ul, class: 'tags' do
               tags.each do |tag|
                 concat content_tag(:li) { link_to tag.name, tag_path(tag) }
               end
             end
           end

    content_tag :div, class: 'aside-widget' do
      concat header
      concat body
    end.html_safe
  end

  def article_list_card(title, articles)
    header = content_tag :header do
              content_tag :h3, title
            end

    body = content_tag :div, class: 'body' do
             content_tag :ul, class: 'clean-list' do
               articles.each do |article|
                 concat content_tag(:li) { link_to article.title, '#' }
               end
             end
           end

    content_tag :div, class: 'aside-widget' do
      concat header
      concat body
    end.html_safe
  end

  def comment_header(comment)
    content_tag(:header, class: 'clearfix') do
               concat image_tag('avatar.png', alt: 'Visitor', class: 'avatar')
               concat(content_tag(:div, class: 'meta') do
                        concat content_tag(:h3, comment.visitor_name)
                        concat content_tag(:span, comment.created_at, class: 'date')
                        concat content_tag(:span, ' - ', class: 'separator')
                        concat link_to('Reply', '#create-comment', class: 'reply-link')
                      end)
             end
  end

  def comment_body(comment)
    content_tag :div, comment.message, class: 'body'
  end

  def comment_card(comment)
    content_tag :article, class: 'comment' do
      comment_header(comment).concat comment_body(comment)
    end.html_safe
  end

  def reply_card(comment)
    content_tag :article, class: 'comment reply' do
      comment_header(comment).concat comment_body(comment)
    end.html_safe
  end


end


