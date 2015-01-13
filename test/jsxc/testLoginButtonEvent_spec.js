QUnit.test( "Check if form has the required event registered", function( assert ) {
  // Initialize JSXC
  jsxc.init({
    root: '/test/jsxc',
    rosterAppend: 'body',
    otr: {
      debug: true,
      SEND_WHITESPACE_TAG: true,
      WHITESPACE_START_AKE: true
    },
    loginForm: {
      form: '#jsxc_loginForm'
    },
    xmpp: {
      jid: 'test@test.de'
    },
    displayRosterMinimized: function() {
      return true;
    },
    loadSettings: function() {
      return false;
    }
  });

  var form = $('#jsxc_loginForm');
  this.spy(jsxc, "prepareLogin");

  assert.ok(form !== undefined, "loginForm exists");
  form.trigger('submit');
  assert.ok(jsxc.prepareLogin.calledOnce);
});
