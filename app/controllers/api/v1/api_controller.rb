class API::V1::APIController < ActionController::API
  
  private
    def set_pagination_headers(pc)
      headers["X-Total-Count"] = pc.total_count
      headers["X-Load-More"] = load_more_link(pc.current_page, pc.total_count)

      links = []
      links << page_link(1, "first") unless pc.first_page?
      links << page_link(pc.prev_page, "prev") if pc.prev_page
      links << page_link(pc.next_page, "next") if pc.next_page
      links << page_link(pc.total_pages, "last") unless pc.last_page?
      headers["Link"] = links.join(", ") if links.present?
    end

    def page_link(page, rel)
      base_uri = request.url.split("?").first
      "<#{base_uri}?#{request.query_parameters.merge(page: page).to_param}>; rel='#{rel}'"
    end

    def load_more_link(page, pc_count)
      base_uri = request.url.split("?").first
      "<#{base_uri}?#{request.query_parameters.merge(page: page, pageSize: pc_count + 25).to_param}>; rel=self"
    end
end
