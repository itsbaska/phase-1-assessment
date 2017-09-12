require_relative '../actor'
require_relative '../director'
require_relative '../film_project'

RSpec.describe FilmProject do

  let(:film_project) do
    # Note: 3_500_000 is exactly the same as 3500000, just somewhat easier to read
    FilmProject.new(title: 'Movie 1', director: director, cast: actors, casting_budget: 3_500_000)
  end

  let(:director) { Director.new }
  let(:actors) { [actor_1, actor_2] }
  let(:actor_1) { Actor.new(salary: 100) }
  let(:actor_2) { Actor.new(salary: 100) }


  describe 'attributes' do
    it 'has a title' do
      expect(film_project.title).to eq 'Movie 1'
    end

    it 'allows updates to title' do
      film_project.title = 'Movie 2'
      expect(film_project.title).to eq 'Movie 2'
    end

    it 'has a director' do
      expect(film_project.director).to eq director
    end

    it 'can change the director' do
      new_director = Director.new

      expect(film_project.director).to eq director
      film_project.director = new_director
      expect(film_project.director).to eq new_director
    end

    it 'has a cast' do
      expect(film_project.cast).to match_array actors
    end

    it 'has a casting budget' do
      expect(film_project.casting_budget).to eq 3_500_000
    end
  end

  describe 'working with the cast', { pending: false } do
    describe '#remaining_budget' do
      it 'calculates the amount of casting budget left after paying the currect cast' do
        actor_1 = Actor.new(salary: 1_000_000)
        actor_2 = Actor.new(salary: 1_250_000)

        film_project = FilmProject.new(cast: [actor_1, actor_2], casting_budget: 2_500_000)

        expect(film_project.remaining_budget).to be 250_000
      end

      it 'does not modify the casting budget' do
        actor_1 = Actor.new(salary: 1_000_000)
        actor_2 = Actor.new(salary: 1_250_000)

        film_project = FilmProject.new(cast: [actor_1, actor_2], casting_budget: 2_500_000)

        expect(film_project.casting_budget).to eq 2_500_000
        film_project.remaining_budget
        expect(film_project.casting_budget).to eq 2_500_000
      end
    end

    describe '#add_actor' do
      let(:film_project) do
        FilmProject.new(cast: [cast_actor], casting_budget: 1_000_000)
      end
      let(:cast_actor) { Actor.new(salary: 0) }

      context "when the new actor's salary fits within the remaining budget" do
        let(:affordable_actor) { Actor.new(salary: 1_000_000) }

        it "adds the actor to the cast" do
          expect(film_project.cast).to match_array [cast_actor]
          film_project.add_actor(affordable_actor)
          expect(film_project.cast).to match_array [cast_actor, affordable_actor]
        end

        it 'returns true' do
          expect(film_project.add_actor(affordable_actor)).to be true
        end
      end

      context "When the new actor's salary is greater than the remaining budget" do
        let(:unaffordable_actor) { Actor.new(salary: 999_999_999_999) }

        it "does not add the actor to the cast" do
          expect(film_project.cast).to match_array [cast_actor]
          film_project.add_actor(unaffordable_actor)
          expect(film_project.cast).to match_array [cast_actor]

        end

        it "returns false" do
          expect(film_project.add_actor(unaffordable_actor)).to be false
        end
      end
    end

    describe '#headliners' do
      it 'returns actors in the cast with a popularity rating above 8' do
        headliner_1      = Actor.new(popularity_rating: 10)
        headliner_2      = Actor.new(popularity_rating: 9)
        almost_headliner = Actor.new(popularity_rating: 8)
        unpopular_actor  = Actor.new(popularity_rating: 2)

        film_project = FilmProject.new(cast: [almost_headliner, headliner_1, unpopular_actor, headliner_2])
        expect(film_project.headliners).to match_array [headliner_1, headliner_2]
      end
    end
  end
end
