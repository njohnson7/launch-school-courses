$(_ => $(':checkbox').change(e => $(`.games li:contains(${$(e.target).val()})`).toggle()));
