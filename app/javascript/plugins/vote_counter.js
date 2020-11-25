const countVotes = () => {
 const votes = document.querySelectorAll(".badge");
 let votes_result = [];
 votes.forEach(e => votes_result.push(parseInt(e.textContent.replace(/\D/g,'')))
  );
 let max_votes = Math.max(...votes_result);
 let position = votes_result.indexOf(max_votes);
 const result_div = votes[position];
 result_div.style.backgroundColor = "red";
};
export { countVotes };
