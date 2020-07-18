import Foundation
import CommonsUI

protocol MovieDetailViewModelling: ViewModelling {}

final class MovieDetailViewModel {}

extension MovieDetailViewModel: MovieDetailViewModelling {
    var modelledView: ModelledView { return MovieDetailView(viewModel: self) }
}
