const createTemplates = _ => $('[type="text/x-handlebars"]').get().reduce((templates, templ) => ({
  [templ.id]: Handlebars.compile(templ.innerHTML), ...templates
}), {})
