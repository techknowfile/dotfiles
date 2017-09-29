# Model-free Prediction (Lecture 4)
Monte-carlo for blackjack. Using policy evaluation, we take a policy (state -> action) and learn the value function for that policy by running over a series of episodes using that policy. As $N -> INF, V(s) -> v_\pi(s)$.

The value function does depend on every aspect of the environment. How many 10's are there? How does the dealer act? How were the cards shuffled (randomness)? But we don't need to tell the agent any of this. By simply sampling returns, we can go straight to the value function, which will lead us to optimal behavior.

Negative: Forward-looking. Have to wait until the end of the episode.

## Incremental Monte-Carlo Updates
$ N(S_t) \leftarrow N(S_t) + 1 $

$V(S_t) \leftarrow V(S_t) + 1/N(S_t)(G_t-V(S_t))$

Note that $1/N(S_t)$ is a step size. We move incrementally closer to the true average by taking a small step in the direction of the error.

In dynamic environments, it can be useful to forget old episodes.
Apply a constant step-size (alpha). Non-stationary estimators of the mean end up being useful with policy improvement, because the thing that we're evaluating is getting better and better.
$V(S_t) \leftarrow V(S_t) + alpha(G_t-V(S_t))$

## Temporal-Difference Learning
    * Similar to MC, it learns directly from episodes of experience. Model-free. No knowledge of MDP transitions / rewards.
    * Bootstraps - Learns from incomplete episodes
    * Update our guess of our value function using another guess.

### TD(0)
   * Unlike MC, instead of using the return (G_t) to update our value function, use the reward we receive on the next step plus the current **estimated** value of that next state. R_{t+1} + \gamma *V(S_{t+1})

### Monte-Carlo vs TD(0)
   * Notice that TD(0) reduces down to the transition probabilities to the possible next states, taking advantage of the markov property and implicitly building the underlying MDP.

### TD($\lambda$)
   * Take an average over the return of estimates at different depths, weighted by $\lambda$.
   * The $\lambda$-return $(G_t)^\lambda$ combines all n-step returns $(G_t)^n$
   * = (1-λ)∑(n=1->∞)(λ^{n-1}G_t^n)
   * Forward-view TD(λ)
       * V(S_t) \leftarrow V(S_t) + α((G_t)^λ - V(S_t))
   * Note: To do this, we again have to wait until the end of the episode before we can update our values.

#### Backward-view TD(λ)
   * Forward view provided us with theory.
   * Backward view provides mechanism
   * Updates online, every step, with incomplete sequences.

**Enter ELIGIBILTY TRACES**
   * Bell, Bell, Bell, Light, SHOCK
   * What caused the shock? The bell or the light? Frequency or Recency? Eligibility traces combine these heuristics
   * Keep an eligibility trace for every state s
   * Update value V(s) for every state s
   * In proportion to TD-error \delta_t and eligibility trace E_t(s)
    
   * This is the credit assingment problem.
   * E_0(s) = 0
   * E_t(s) = γλE_{t-1}(s)+1(S_t = s) 

* Offline, TD(λ) forward and backward view algorithms are identically equivalent

# Model-free Control (Lecture 5)
    * In order to do greedy policy improvement over V(s), we need a model of the MDP (argmax(a) ..., testing the dynamics and picking each action). We don't want to learn the dynamics, we're trying to be model free.
    * We can do greedy policy improvement over Q(s,a), which is model free.
        * \pi'(s)  = argmax_{a\in A}Q(s,a)
        * By caching the values of our actions, we remove the burden of needing to learn/save the transition model
    * If we don't see certain states/actions, then we won't evaluate them properly and we'll never select them. Need to make sure we see everything.
## Epsilon-greedy (\epsilon-Greedy) exploration 

## Greedy in the Limit with Infinite Exploration
  * All state-action pairs are explored infinitely many times lim_{k->\inf}(N_k(s,a) = ∞)

## SARSA
  * Q(S,A) \leftarrow Q(S,A) + \alpha*(R+\gammaQ(S',A') - Q(S,A))
  * n-step Q-return,  replace R+\gammaQ(S',A') with (q_t)^n
  * $SARSA(\lambda)$, plug in $(q_t)^\lambda = (1-\lambda)\sigma(n \leftarrow 1 to \inf) \lambda^{n-1}q_t^n$
  * Again, we're looking forward in time. Not online. Needs oracle or has to wait until end of episode

  * In Sarsa(\lambda), \lambda tells you how far the information should propagate back through the trajectory. SARSA(0) only updates one step. SARSA(\lambda) for \lambda = (0, 1], once we reach a Q(S,A) with high value, how far back along the trajectory we should look (all values updated based on their eligibility)

## Importance Sampling
   * Monte-Carlo learning is a terrible idea off-policy

-- NOTES
* Cool trend for handling variance and exploration.
    * Reduce the weight of reward values that have higher variance
    * 1/k exploration. Coin with changing probability, don't need to explicitly keep track of pi. Just need q and 1/k
    * 

# Value Function Approximation
## Gradient Descent


# Integrating Learning and Planning (Lecture 8)
## Advantages of Model-based
   * It can be hard to learn the value of a specific state when slight changes to that state result in drastically different returns. Like in chess, if a piece is one square off, it could be the difference between a win and a loss. This makes it extremely difficult to learn directly from experience. However, the model for the game is quite simple, it's simply the rules of the game. "If I move the pawn forward 2 steps, then I'll be in a new state where the pawn is to squares forward".
   * If you can use that model to look ahead, I can estimate the value function by planning (tree search for chess)
   * Model can be a more compact/useful representation than a value function or a policy.
   * Can be efficiently learned by supervised learning methods.
   * "Can reason about model uncertainty"
## Disadvantages of Model-based
   * First learn a model, then construct a value function => Two sources of approximation error.
# Model Learning
   * Interesting: When doing sample-based learning, say for a robot, you can use all the real experience you receive to build a better and better model, and then you can continuously take samples from the model to learn the optimal policy based on your current model, which the robot can pull from anytime it needs to determine the best action
   * Having a model allows us to use value iteration, policy iteration, tree search, ... all the things that we couldn't use on model-free for control now become available tools
   * Maximum-likelihood model is naive, and we can use Bayesian MDP models to include uncertainty. 
   
# Classic Games
   *  If we’re learning the dealer’s policy and adapting to how he is playing, and he’s adapting to how we’re playing, then we’d learn the best joint policy, which could tell us how to play not just against that dealer, but potentially against any dealer, because we’ve learned a much more powerful solution concept that tells us about plays in general about the game.
