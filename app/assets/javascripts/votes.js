Document.onLoad(
  $('.downvote').onClick(function (my_voter) {
    my_voter.preventDefault();
    $.post(
    url: my_voter.attr('href'),
    data: {
      vote_type: 'down'
    },
    success: function () {
      my_voter.hide();
    }
    );
  });
);