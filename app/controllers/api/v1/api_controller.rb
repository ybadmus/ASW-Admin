class API::V1::APIController < ActionController::API
  
  private
    def set_pagination_headers(pc)
      headers["X-Total-Count"] = pc.total_count
      headers["X-Load-More"] = load_more_link(pc.current_page, pc.total_count)

      links = []
      links << page_link(1, "first")
      links << page_link(pc.prev_page || 1, "prev")
      links << page_link(pc.next_page || pc.current_page, "next")
      links << page_link(pc.total_pages, "last")
      headers["Link"] = links.join(", ") if links.present?
    end

    def page_link(page, rel)
      base_uri = request.url.split("?").first
      "<#{base_uri}?#{request.query_parameters.merge(page: page).to_param}>; rel='#{rel}'"
    end

    def load_more_link(page, pc_count)
      base_uri = request.url.split("?").first
      "<#{base_uri}?#{request.query_parameters.merge(page: page, pageSize: pc_count + 20).to_param}>; rel='self'"
    end
end
