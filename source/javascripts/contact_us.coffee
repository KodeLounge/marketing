window.contactUs = ()=>
  submitContactUsForm = ()->
    form                                 = $('#contact-us-form')
    submitBtn                            = form.find("#submit-contact-us")
    contactUsData                        = {}
    contactUsData.name                   = form.find('#name-contact-us').val()
    contactUsData.email                  = form.find('#email-contact-us').val()
    contactUsData.subject                = form.find('#subject-contact-us').val()
    contactUsData.message                = form.find('#message-contact-us').val()

    formData = {"marketing_lead" : contactUsData}
    
    $.ajax
      type: "POST"
      url: "https://hwn6h6xd40.execute-api.us-east-2.amazonaws.com/default/save-marketing-lead-info"
      method: 'POST'
      headers: 
        'Accept': 'application/json'
      data: JSON.stringify(formData)
      success: (data, textStatus, jqXHR) =>
        alert("SUCCESSFUL!!!")
      error: (jqXHR, textStatus, errorThrown) =>
        alert("ERROR OCCURRED!!!")

  $('body').on 'click', '#submit-contact-us', (e)->
    e.preventDefault();
    if $('#contact-us-form').parsley().validate()
      $(e.target).attr('disabled', true)
      $(e.target).addClass('disabled')
      submitContactUsForm()
