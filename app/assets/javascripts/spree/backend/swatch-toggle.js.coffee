$(document).ready(()->

  TabGroupOption = (selector)->
    if typeof selector == 'string'
      return new TabGroupOption($(selector))
    else if 1 < selector.length
      return selector.each((i, e)->
        new TabGroupOption($(e))
      )

    this.getTab = (obj)->
      $('label[for="' + obj.attr('id') + '"]')

    this.obj = selector
    this.tab = this.getTab(this.obj)
    this.allTabOptions = $('[name="' + this.obj.attr('name') + '"]')

    this.clearTabStates = ()->
      this.allTabOptions.each(((i, e)->
        $me = $(e)
        tab = this.getTab($me)
        tab.removeClass('is-active')
        $me.next().find('input').attr('disabled', 'disabled')
      ).bind(this))

    this.obj.change(((ev)->
      el = ev.target
      if el.checked
        # set others as not active
        this.clearTabStates()
        this.tab.toggleClass('is-active', el.checked)
        $(el).next().find('input').removeAttr('disabled')
      ).bind(this)
    ).change()

    this.obj

  new TabGroupOption('.tab-group--option')
)
